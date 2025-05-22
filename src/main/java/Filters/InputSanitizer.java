package Filters;

import org.owasp.html.PolicyFactory;
import org.owasp.html.Sanitizers;

public class InputSanitizer {
    private static final PolicyFactory POLICY = Sanitizers.FORMATTING
                                                .and(Sanitizers.LINKS)
                                                .and(Sanitizers.BLOCKS)
                                                .and(Sanitizers.STYLES);

    public static String sanitize(String input) {
        if (input == null) return "";
        return POLICY.sanitize(input);
    }
}
