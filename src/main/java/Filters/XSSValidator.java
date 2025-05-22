package Filters;

public class XSSValidator {
	public static boolean isMaliciousInput(String input) {
        if (input == null || input.trim().isEmpty()) {
            return false;
        }

        String lower = input.toLowerCase();

        // Loại bỏ các khoảng trắng thừa để tránh bypass kiểu: <  script >
        lower = lower.replaceAll("\\s+", "");

        // Các mẫu nguy hiểm thường gặp trong XSS
        String[] dangerousPatterns = {
            "<script", "</script",     // thẻ script
            "javascript:",             // URI javascript
            "onerror=", "onload=",     // inline event handler
            "<iframe", "</iframe",     // iframe có thể chèn nội dung độc
            "<img", "<svg", "<embed",  // thẻ đa phương tiện chứa onerror/JS
            "alert(", "prompt(", "confirm(", // các hàm gây popup
            "document.cookie", "document.location", // đọc cookie hoặc chuyển hướng
            "<object", "<link", "<meta" // thẻ nguy hiểm khác
        };

        for (String pattern : dangerousPatterns) {
            if (lower.contains(pattern)) {
                return true;
            }
        }

        return false;
    }

}
