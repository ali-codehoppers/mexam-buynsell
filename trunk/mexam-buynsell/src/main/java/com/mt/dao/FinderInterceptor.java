package com.mt.dao;

import com.mt.idao.IFinderExecutor;
import java.lang.reflect.InvocationTargetException;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.aop.IntroductionInterceptor;

public class FinderInterceptor implements IntroductionInterceptor {

    public Object invoke(MethodInvocation invocation) throws Throwable {
        try {
            IFinderExecutor fe = (IFinderExecutor) invocation.getThis();
            String methodName = invocation.getMethod().getName();
            if (methodName.startsWith("find")) {
                return fe.executeFinder(invocation.getMethod(), invocation.getArguments());
            } else {
                return invocation.proceed();
            }
        } catch (InvocationTargetException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean implementsInterface(Class intf) {
        return intf.isInterface() && IFinderExecutor.class.isAssignableFrom(intf);
    }
}
