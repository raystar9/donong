package team.swcome.donong.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import team.swcome.donong.dto.SessionBean;

@Aspect
@Component
public class AOPLogin {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Around("execution(* team.swcome.donong.controller.*.* (.., team.swcome.donong.dto.SessionBean, ..)) "
			+ "and !execution(* team.swcome.donong.controller.*.*WithoutLogin (.., team.swcome.donong.dto.SessionBean, ..))")
	public Object LoginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		Object[] args = joinPoint.getArgs();
		SessionBean sessionBean = null;
		for(Object arg : args) {
			if(arg instanceof SessionBean) {
				sessionBean = (SessionBean) arg;
				break;
			}
		}
		MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
		String returnType = methodSignature.getMethod().getReturnType().getSimpleName();
		logger.debug("{}", sessionBean.getMemberNum());
		logger.debug("returnType : {}", returnType);
		if(sessionBean.getMemberNum() == 0) {
			if(returnType.equals("ModelAndView")) {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("common/login-error");
				return mv;
			} else {
				return "common/login-error";				
			}
		} else {
			return joinPoint.proceed();
		}
	}
}
