package team.swcome.donong.aop;

import java.lang.reflect.Method;
import java.util.List;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AOPLogger {

	@SuppressWarnings("rawtypes")
	@Around("execution(* team.swcome.donong.controller.*.* (..)) "
			+ "or execution(* team.swcome.donong.service.*.* (..)) "
			+ "or execution(* team.swcome.donong.dao.*.* (..))")
	public Object LoggerAspect(ProceedingJoinPoint joinPoint) throws Throwable {
		Logger logger = LoggerFactory.getLogger(joinPoint.getTarget().getClass());
		logger.debug(joinPoint.getSignature().getName() + "()");
		Object[] args = joinPoint.getArgs();

		if (args.length == 0) {
			logger.trace("  >> no args");
		} else {
			for (Object arg : args) {
				if (arg instanceof List) {
					for (Object resEach : ((List) arg)) {
						StringBuilder sb = new StringBuilder(resEach.getClass().getSimpleName() + " {");
						Method[] methods = resEach.getClass().getMethods();

						for (Method method : methods) {
							String methodName = method.getName();
							if (methodName.startsWith("get") && methodName != "getClass") {
								sb.append(methodName.substring(3, methodName.length()) + " : " + method.invoke(resEach)
										+ ", ");
							}
						}
						String logString = sb.substring(0, sb.length() - 2) + "}";
						logger.trace("  >> {}", logString);
					}
				} else {
					logger.trace("  >> {}", arg);
				}
			}
		}
		Object res = joinPoint.proceed(args);
		if (res instanceof List) {
			@SuppressWarnings("unchecked")
			List<Object> resArray = (List) res;
			if (resArray.size() == 0) {
				logger.trace("Return : empty List");
			} else {
				for (Object resEach : resArray) {
					StringBuilder sb = new StringBuilder(resEach.getClass().getSimpleName() + " {");
					Method[] methods = resEach.getClass().getMethods();

					
					for (Method method : methods) {
						String methodName = method.getName();
						if (methodName.startsWith("get") && methodName != "getClass") {
							sb.append(methodName.substring(3, methodName.length()) + " : " + method.invoke(resEach)
									+ ", ");
						}
					}
					String logString = sb.substring(0, sb.length() - 2) + "}";
					logger.trace("Return : {}", logString);
				}
			}
		} else {
			logger.trace("Return : {}", res);
		}
		logger.debug(joinPoint.getSignature().getName() + "() end");
		return res;
	}
}
