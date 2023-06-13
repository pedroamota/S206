package aula_inatel.countries;

import com.intuit.karate.junit5.Karate;

public class CountriesRunner {
    @Karate.Test
    Karate testStarWars() {
        return Karate.run("countries").relativeTo(getClass());
    }     
}
