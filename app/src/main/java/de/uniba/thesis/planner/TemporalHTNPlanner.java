package de.uniba.thesis.planner;

import fr.uga.pddl4j.parser.RequireKey;
import fr.uga.pddl4j.plan.Plan;
import fr.uga.pddl4j.planners.ProblemNotSupportedException;
import fr.uga.pddl4j.planners.htn.stn.AbstractSTNPlanner;
import fr.uga.pddl4j.problem.Problem;
import fr.uga.pddl4j.problem.State;
import fr.uga.pddl4j.problem.operator.Action;
import fr.uga.pddl4j.problem.operator.Method;

import java.util.Comparator;
import java.util.List;
import java.util.PriorityQueue;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;

@CommandLine.Command(name = "TemporalHTNPlanner", version = "TemporalHTNPlanner 0.1", description = "Solves a specified HTN planning problem with time constraints using a Partial-order Forward Decomposition strategy.", sortOptions = false, mixinStandardHelpOptions = true, headerHeading = "Usage:%n", synopsisHeading = "%n", descriptionHeading = "%nDescription:%n%n", parameterListHeading = "%nParameters:%n", optionListHeading = "%nOptions:%n")
public class TemporalHTNPlanner extends AbstractSTNPlanner {

  private static final Logger LOGGER = LogManager.getLogger(TemporalHTNPlanner.class.getName());

  /**
   * Returns if a specified problem is supported by the planner.
   *
   * @param problem the problem to test.
   * @return <code>true</code> if the problem is supported <code>false</code>
   *         otherwise.
   */
  @Override
  public boolean isSupported(Problem problem) {
    return (problem.getRequirements().contains(RequireKey.ACTION_COSTS)
        || problem.getRequirements().contains(RequireKey.CONSTRAINTS)
        || problem.getRequirements().contains(RequireKey.CONTINOUS_EFFECTS)
        || problem.getRequirements().contains(RequireKey.DERIVED_PREDICATES)
        || problem.getRequirements().contains(RequireKey.DURATION_INEQUALITIES)
        || problem.getRequirements().contains(RequireKey.FLUENTS)
        || problem.getRequirements().contains(RequireKey.GOAL_UTILITIES)
        || problem.getRequirements().contains(RequireKey.METHOD_CONSTRAINTS)
        || problem.getRequirements().contains(RequireKey.NUMERIC_FLUENTS)
        || problem.getRequirements().contains(RequireKey.OBJECT_FLUENTS)
        || problem.getRequirements().contains(RequireKey.PREFERENCES)
        || !problem.getRequirements().contains(RequireKey.HIERARCHY))
            ? false
            : true;
  }

  @Override
  public Plan solve(Problem problem) throws ProblemNotSupportedException {
    if (!isSupported(problem)) {
      throw new ProblemNotSupportedException("Problem not supported");
    }
    // Create the list of pending nodes to explore
    final PriorityQueue<Node> open = new PriorityQueue<>(1000, new Comparator<Node>() {
      public int compare(Node n1, Node n2) {
        return n1.getTaskNetwork().getTasks().size() - n2.getTaskNetwork().getTasks().size();
      }
    });
    // Create the root node of the search space
    final State init = new State(problem.getInitialState());
    final Node root = new Node(init, problem.getInitialTaskNetwork());

    // Add the root node to the list of the pending nodes to explore.
    open.add(root);

    // Declare the plan used to store the result of the exploration
    Plan plan = null;

    // Get the timeout for searching
    final int timeout = this.getTimeout() * 1000;
    final long start = System.currentTimeMillis();
    long elapsedTime = 0;

    // Start exploring the search space
    while (!open.isEmpty() && plan == null && elapsedTime < timeout) {
      // Get and remove the first node of the pending list of nodes.
      final Node currentNode = open.poll();

      if (this.isInteractive()) {
        LOGGER.info("=========> Pop a new node <=========\n");
        LOGGER.info("=> Current state:");
        LOGGER.info(problem.toString(currentNode.getState()));
        LOGGER.info("\n=> Tasks to be executed:");
        LOGGER.info(problem.toString(currentNode.getTaskNetwork()));
        LOGGER.info(currentNode.getTaskNetwork().getOrderingConstraints().toBitString());
      }

      // If the task network has no more task, a solution is found
      if (currentNode.getTaskNetwork().isEmpty()) {
        if (currentNode.getState().satisfy(problem.getGoal())) {
          return super.extractPlan(currentNode, problem);
        } else {
          if (LOGGER.isDebugEnabled()) {
            Plan p = super.extractPlan(currentNode, problem);
            LOGGER.debug("Found plan but goal not reached as follows:\n" + problem.toString(p) + "\n");
          }
        }
      } else {
        // Get the list of tasks of the current node with no predecessors
        currentNode.getTaskNetwork().getOrderingConstraints().transitiveClosure();
        final List<Integer> tasks = currentNode.getTaskNetwork().getTasksWithNoPredecessors();

        // Get the current state of the search
        final State state = currentNode.getState();
        // For each task with no predecessors
        for (Integer task : tasks) {
          int taskIndex = currentNode.getTaskNetwork().getTasks().get(task);
          final List<Integer> relevantOperators = problem.getTaskResolvers().get(taskIndex);
          // Case of primitive tasks
          if (problem.getTasks().get(taskIndex).isPrimtive()) {
            for (Integer operator : relevantOperators) {
              final Action action = problem.getActions().get(operator);
              if (this.isInteractive()) {
                LOGGER.info("\n======> Try to decompose primitive tasks "
                    + problem.toString(problem.getTasks().get(taskIndex)) + " with \n\n"
                    + problem.toString(action));

                LOGGER.info("=> Current state:");
                LOGGER.info(problem.toString(currentNode.getState()));
              }
              if (state.satisfy(action.getPrecondition())) {
                final Node childNode = new Node(currentNode);
                childNode.setParent(currentNode);
                childNode.setOperator(operator);
                childNode.getState().apply(action.getConditionalEffects());
                childNode.getTaskNetwork().removeTask(task);
                childNode.setTask(taskIndex);
                open.add(childNode);
                if (this.isInteractive()) {
                  LOGGER.info("=====> Decomposition succeeded push node:");
                  LOGGER.info(problem.toString(childNode.getState()));
                  LOGGER.info(problem.toString(problem.getTasks().get(childNode.getTask())));
                  for (int t : childNode.getTaskNetwork().getTasks()) {
                    LOGGER.info(problem.toString(problem.getTasks().get(t)));
                  }
                  LOGGER.info("=> New state:");
                  LOGGER.info(problem.toString(childNode.getState()));
                }
              } else {
                if (this.isInteractive()) {
                  LOGGER.info("=====> Decomposition failed");
                }
              }
              if (this.isInteractive()) {
                AbstractSTNPlanner.waitPressAnyKey();
              }
            }
          } else { // Case of compound tasks
            for (Integer operator : relevantOperators) {
              final Method method = problem.getMethods().get(operator);
              if (this.isInteractive()) {
                LOGGER.info("\n======> Try to decompose compound tasks "
                    + problem.toString(problem.getTasks().get(taskIndex)) + " with\n\n"
                    + problem.toString(method));
              }
              
              if (state.satisfy(method.getPrecondition())) {
                final Node childNode = new Node(currentNode);
                childNode.setParent(currentNode);
                childNode.setOperator(problem.getActions().size() + operator);
                childNode.getTaskNetwork().decompose(task, method);
                childNode.setTask(taskIndex);
                open.add(childNode);
                if (this.isInteractive()) {
                  LOGGER.info("=====> Decomposition succeeded push node:");
                  LOGGER.info(problem.toString(childNode.getTaskNetwork()));
                  LOGGER.info(problem.toString(problem.getTasks().get(childNode.getTask())));
                }
              } else {
                if (this.isInteractive()) {
                  LOGGER.info("=====> Decomposition failed");
                }
              }
              if (this.isInteractive()) {
                AbstractSTNPlanner.waitPressAnyKey();
              }
            }
          }
        }
        elapsedTime = System.currentTimeMillis() - start;
      }
    }
    return plan;
  }

  public static void main(final String[] args) {
    try {
      final TemporalHTNPlanner planner = new TemporalHTNPlanner();
      CommandLine cmd = new CommandLine(planner);
      int exitCode = (int) cmd.execute(args);
      if (exitCode == 1) {
        LOGGER.fatal(cmd.getUsageMessage());
      }
      System.exit(exitCode);
    } catch (Throwable e) {
      LOGGER.fatal(e.getMessage());
    }
  }

}
