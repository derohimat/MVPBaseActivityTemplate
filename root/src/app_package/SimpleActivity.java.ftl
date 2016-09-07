package ${packageName};

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.ProgressBar;
import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;

import javax.inject.Inject;

<#if applicationPackage??>import ${applicationPackage}.R;</#if>

public class ${activityClass} extends BaseActivity implements ${activityClass}MvpView {

    private ${activityClass}Presenter mPresenter;
    private static ProgressBar mProgressBar = null;
	
	@Inject
    EventBus eventBus;
	
	@Override
    protected int getResourceLayout() {
        return R.layout.${layoutName};
    }
	
	@Override
    protected void onViewReady(Bundle savedInstanceState) {
        mPresenter = new ${activityClass}Presenter(this);
        mPresenter.attachView(this);
		
		mPresenter.doSomething(${activityClass}.class.getSimpleName() + " Created");
	}
	
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getComponent().inject(this);
    }
	
	@Override
    public void onStart() {
        super.onStart();
        eventBus.register(this);
    }

    @Override
    public void onStop() {
        eventBus.unregister(this);
        super.onStop();
    }

    @Override
    public void showMessage(String message) {
        Toast.makeText(mContext, message, Toast.LENGTH_LONG).show();
    }
	
	@Subscribe
    public void onEvent(${activityClass}Event event) {
        if (event.isSuccess()) {
            Toast.makeText(mContext, event.getMessage(), Toast.LENGTH_LONG).show();
        } else {
            Toast.makeText(mContext, event.getMessage(), Toast.LENGTH_LONG).show();
        }
    }
	
	@Override
    protected void onDestroy() {
        mPresenter.detachView();
        super.onDestroy();
    }
	
	@Override
    public void showProgress() {
        if (mProgressBar == null) {
            mProgressBar = new ProgressBar(getContext(), null, android.R.attr.progressBarStyleLarge);
			mProgressBar.setIndeterminate(true);
        } else {
            mProgressBar.setVisibility(View.VISIBLE);
        }
    }
	
	@Override
    public void hideProgress() {
        mProgressBar.setVisibility(View.GONE);
    }
	
	@Override
    public Context getContext() {
        return this;
    }
}
