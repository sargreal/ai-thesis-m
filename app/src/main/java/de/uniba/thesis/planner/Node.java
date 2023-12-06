package de.uniba.thesis.planner;

import java.util.Objects;

import fr.uga.pddl4j.planners.htn.stn.AbstractSTNNode;
import fr.uga.pddl4j.problem.State;
import fr.uga.pddl4j.problem.operator.TaskNetwork;

public class Node extends AbstractSTNNode  {


    /**
     * The task network that describes the set of tasks to be accomplished and their constraints that have to be
     * verified.
     */
    private TaskNetwork taskNetwork;

    /**
     * Creates a new node from an other. This constructor creates a deep copy of the node in parameters.
     *
     * @param other the node to be copied.
     */
    public Node(final Node other) {
        super(other);
        this.setTaskNetwork(new TaskNetwork(other.getTaskNetwork()));
    }

    /**
     * Creates a new empty node with an empty state and an empty task network. The parent node is set to null, the
     * operator is set to DEFAULT_OPERATOR and the task is set to DEFAULT_TASK.
     */
    public Node() {
        super();
        this.setTaskNetwork(new TaskNetwork());
    }

    /**
     * Creates a new node with a specified state and task network. The parent node is set to null, the operator is set
     * to DEFAULT_OPERATOR and the task is set to DEFAULT_TASK.
     *
     * @param state       state of this node.
     * @param taskNetwork the task network of the node.
     */
    public Node(final State state, final TaskNetwork taskNetwork) {
        super(state, null, DEFAULT_OPERATOR, DEFAULT_TASK);
        this.setTaskNetwork(taskNetwork);
    }

    /**
     * Creates a new node with a specified state and task network.
     *
     * @param state       srate of this node.
     * @param taskNetwork the task network of the node.
     * @param parent      the parent node of the node.
     * @param operator    the index of the operator applied to reach the node.
     * @param task        the task processed in this node.
     */
    public Node(final State state, final TaskNetwork taskNetwork, final Node parent,
                   final int operator, final int task) {
        super(state, parent, operator, task);
        this.setTaskNetwork(taskNetwork);
    }

    /**
     * Returns the task network of the node. The task network describes the set of tasks to be accomplished
     * and their constraints that have to be verified.
     *
     * @return the task network of the node.
     */
    public final TaskNetwork getTaskNetwork() {
        return this.taskNetwork;
    }

    /**
     * Sets the tasks network of the node. The task network describes the set of tasks to be accomplished
     * and their constraints that have to be verified.
     *
     * @param taskNetwork the task network of the node.
     */
    public final void setTaskNetwork(final TaskNetwork taskNetwork) {
        this.taskNetwork = taskNetwork;
    }

    /**
     * Returns <code>true</code> if a node is equals to an other object. An object is equals to this node if and only
     * if the other object is an instance of <code>Node</code> and have the same task network.
     *
     * @param obj the object to be compared.
     * @return <code>true</code> if a node is equals to an other object, <code>false</code> otherwise.
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(final Object obj) {
        if (obj != null && obj instanceof Node) {
            Node other = (Node) obj;
            return this.getState().equals(other.getState()) && this.getTaskNetwork().equals(other.getTaskNetwork());
        }
        return false;
    }

    /**
     * Returns the hash code value of the node.
     *
     * @return the hash code value of the node.
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        return Objects.hash(this.getState(), this.getTaskNetwork());
    }
  
}
