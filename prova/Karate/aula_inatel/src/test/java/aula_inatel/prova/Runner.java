package aula_inatel.prova;

import com.intuit.karate.junit5.Karate;

public class Runner {
    @Karate.Test
    Karate testStarWars() {
        return Karate.run("countries").relativeTo(getClass());
    }     
}
