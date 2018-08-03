package team.swcome.donong.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import team.swcome.donong.dto.SessionBean;

@Aspect
@Component
public class AOPLogin {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Around("execution(* team.swcome.donong.controller.*.* (.., team.swcome.donong.dto.SessionBean, ..)) "
			+ "and !execution(* team.swcome.donong.controller.*.*WithoutLogin (.., team.swcome.donong.dto.SessionBean, ..))")
	public String LoginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		Object[] args = joinPoint.getArgs();
		SessionBean sessionBean = null;
		for(Object arg : args) {
			if(arg instanceof SessionBean) {
				sessionBean = (SessionBean) arg;
				break;
			}
		}
		logger.debug("{}", sessionBean.getMemberNum());
		if(sessionBean.getMemberNum() == 0) {
			return "redirect:/error";
		}
		return (String)joinPoint.proceed();
	}
}
