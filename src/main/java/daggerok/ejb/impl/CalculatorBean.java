package daggerok.ejb.impl;

import daggerok.ejb.api.CalculatorRemote;

import javax.ejb.Stateless;
import java.util.Arrays;

@Stateless
public class CalculatorBean implements CalculatorRemote {

  @Override
  public int add(final int... ints) {

    return Arrays.stream(ints)
                 .sum();
  }
}
