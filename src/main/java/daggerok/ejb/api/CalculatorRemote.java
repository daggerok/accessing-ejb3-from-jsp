package daggerok.ejb.api;

import javax.ejb.Remote;

@Remote
public interface CalculatorRemote {

  int add(final int... ints);
}
