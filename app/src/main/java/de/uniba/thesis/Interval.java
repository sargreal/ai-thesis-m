package de.uniba.thesis;

import java.util.Arrays;
import java.util.List;

import org.checkerframework.checker.units.qual.min;
import org.chocosolver.solver.Model;
import org.chocosolver.solver.constraints.Constraint;
import org.chocosolver.solver.variables.IntVar;

public class Interval {

  private final String name;
  private final Model model;
  private final IntVar start;
  private final IntVar end;

  public Interval(String name, Model model, int min, int max, int duration) {
    this.name = name;
    this.model = model;
    this.start = model.intVar(name + "_start", min, max);
    this.end = model.intVar(name + "_end", min, max);
    model.arithm(end, "-", start, "=", duration).post();
  }

  public Constraint before(Interval other) {
    return model.arithm(this.end, "<=", other.start);
  }

  public Constraint after(Interval other) {
    return model.arithm(this.start, ">=", other.end);
  }

  public Constraint starts(Interval other) {
    return model.arithm(this.start, "=", other.start);
  }

  public Constraint finishes(Interval other) {
    return model.arithm(this.end, "=", other.end);
  }

  public Constraint during(Interval other) {
    return model.and(model.arithm(this.start, ">=", other.start), model.arithm(this.end, "<=", other.end));
  }

  public Constraint overlaps(Interval other) {
    return model.and(model.arithm(this.start, "<", other.end),
        model.arithm(this.end, ">", other.start));
  }

  public Constraint meets(Interval other) {
    return model.arithm(this.end, "=", other.start);
  }

  public Constraint equals(Interval other) {
    return model.and(model.arithm(this.start, "=", other.start),
        model.arithm(this.end, "=", other.end));
  }

  public IntVar getStart() {
    return start;
  }

  public IntVar getEnd() {
    return end;
  }

  public List<IntVar> getVars() {
    return Arrays.asList(start, end);
  }

  @Override
  public String toString() {
    return name + "[" + start.getValue() + ", " + end.getValue() + "]";
  }
}
