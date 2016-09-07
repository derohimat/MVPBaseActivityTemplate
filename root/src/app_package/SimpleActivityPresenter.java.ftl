package ${packageName};

import android.content.Context;
import net.derohimat.baseapp.presenter.BasePresenter;
import javax.inject.Inject;

public class ${activityClass}Presenter implements BasePresenter<${activityClass}MvpView> {

    private ${activityClass}MvpView mMvpView;
    private Subscription mSubscription;
	
	@Inject
    public ${activityClass}Presenter(Context context) {
        ((BaseApplication) context.getApplicationContext()).getApplicationComponent().inject(this);
    }
	
	@Override
    public void attachView(${activityClass}MvpView view) {
        mMvpView = view;
    }
	
	@Override
    public void detachView() {
        mMvpView = null;
        if (mSubscription != null) mSubscription.unsubscribe();
    }
	
    public void doSomething(String message) {
        if (mSubscription != null) mSubscription.unsubscribe();
		mMvpView.showMessage(message);
	}
}
