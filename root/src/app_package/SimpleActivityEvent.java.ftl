package ${packageName};

import android.support.annotation.Nullable;

public class ${activityClass}Event {
	
	@Nullable
    private final boolean success;
    @Nullable
    private final String message;

    public ${activityClass}Event(boolean success, @Nullable String message) {
        this.success = success;
        this.message = message;
    }

    @Nullable
    public boolean isSuccess() {
        return success;
    }

    @Nullable
    public String getMessage() {
        return message;
    }
}
