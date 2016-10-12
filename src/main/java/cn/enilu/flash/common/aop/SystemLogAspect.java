package cn.enilu.flash.common.aop;

import cn.enilu.flash.common.utils.IpUtil;
import cn.enilu.flash.core.util.JsonUtil;
import cn.enilu.flash.common.entity.Logs;
import cn.enilu.flash.common.entity.User;
import cn.enilu.flash.common.service.LogsService;
import cn.enilu.flash.common.service.UserContextLoader;
import cn.enilu.flash.web.auth.UserContext;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

/**
 * 系统日志切面<br>
 * </p> Copyright by easecredit.com<br>
 * 作者: zhangtao <br>
 * 创建日期: 16-9-11<br>
 */
@Aspect
@Component
public class SystemLogAspect {
    @Inject
    private UserContextLoader userContextLoader;
    //注入Service用于把日志保存数据库
    @Resource
    private LogsService logsService;
    //本地异常日志记录对象
    private  static  final Logger logger = LoggerFactory.getLogger(SystemLogAspect.class);

    //controller层切入点

    @Pointcut("@annotation(cn.enilu.flash.common.aop.SystemControllerLog)")
    public void controllerAspect() {
        logger.info("========controllerAspect===========");
    }
    //service层切入点

    @Pointcut("@annotation(cn.enilu.flash.common.aop.SystemServiceLog)")
    public void serviceAspect() {
        logger.info("========serviceAspect===========");
    }

    /**
     * 前置通知 用于拦截Controller层操作
     * @param joinPoint 切点
     */
    @Before("controllerAspect()")
    public void doBefore(JoinPoint joinPoint) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
        // 获取登陆用户信息
        Object uid = request.getSession().getAttribute(UserContext.USER_ID_SESSION_ATTRIBUTE);
        if (uid != null) {
            UserContext userContext = userContextLoader.load(uid.toString());
            User manager =userContext.getUser();
            // 获取请求ip
            String ip = IpUtil.getClientIp(request);
            try {

                Logs log = new Logs();
                log.setAction(getControllerMethodDescription(joinPoint));
                log.setOperatorName(manager.getName());
                log.setClassName(joinPoint.getTarget().getClass().getName());
                log.setMethodName(joinPoint.getSignature().getName());
                log.setIp(ip);
                log.setOperator(manager.getId());

                // 保存数据库
                logsService.create(log);
                System.out.println("=====前置通知结束=====");
            } catch (Exception e) {
                // 记录本地异常日志
                logger.error("==前置通知异常==");
                logger.error("异常信息:{}", e);
            }
        }



    }

    /**
     * 异常通知 用于拦截service层记录异常日志
     * @param joinPoint
     * @param e
     */
    @AfterThrowing(pointcut="serviceAspect()", throwing="e")
    public void doAfterThrowing(JoinPoint joinPoint, Throwable e) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();

        // 获取登陆用户信息
        Object uid = request.getSession().getAttribute(UserContext.USER_ID_SESSION_ATTRIBUTE);
        if (uid != null) {
            UserContext userContext = userContextLoader.load(uid.toString());
            User manager =userContext.getUser();
            // 获取请求ip
            String ip = IpUtil.getClientIp(request);
            // 获取用户请求方法的参数并序列化为JSON格式字符串
            String params = "";
            Object[] args = joinPoint.getArgs();
            if (args != null) {

                params = JsonUtil.dump(args);
            }
            try {

            /* ==========数据库日志========= */
                Logs log = new Logs();
                log.setAction(getServiceMthodDescription(joinPoint));
                log.setOperatorName(manager.getName());
                log.setClassName(joinPoint.getTarget().getClass().getName());
                log.setMethodName(joinPoint.getSignature().getName());
                log.setIp(ip);
                log.setOperator(manager.getId());
                log.setExceptionCode(e.getClass().getName());
                log.setExceptionDetail(e.getMessage());
                log.setParams(params);
                // 保存数据库
                logsService.create(log);
            } catch (Exception ex) {
                // 记录本地异常日志
                logger.error("==异常通知异常==");
                logger.error("异常信息:{}", ex);
            }
        }


    }

    /**
     * 获取注解中对方法的描述信息 用于Controller层注解
     * @param joinPoint 切点
     * @return 方法描述
     * @throws Exception
     */
    public static String getControllerMethodDescription(JoinPoint joinPoint) throws Exception{
        //获取目标类名
        String targetName = joinPoint.getTarget().getClass().getName();
        //获取方法名
        String methodName = joinPoint.getSignature().getName();
        //获取相关参数
        Object[] arguments = joinPoint.getArgs();
        //生成类对象
        Class targetClass = Class.forName(targetName);
        //获取该类中的方法
        Method[] methods = targetClass.getMethods();

        String description = "";

        for(Method method : methods) {
            if(!method.getName().equals(methodName)) {
                continue;
            }
            Class[] clazzs = method.getParameterTypes();
            if(clazzs.length != arguments.length) {
                continue;
            }
            description = method.getAnnotation(SystemControllerLog.class).description();
        }
        return description;
    }

    /**
     * 获取注解中对方法的描述信息 用于service层注解
     * @param joinPoint 切点
     * @return 方法描述
     * @throws Exception
     */
    public static String getServiceMthodDescription(JoinPoint joinPoint) throws Exception{
        //获取目标类名
        String targetName = joinPoint.getTarget().getClass().getName();
        //获取方法名
        String methodName = joinPoint.getSignature().getName();
        //获取相关参数
        Object[] arguments = joinPoint.getArgs();
        //生成类对象
        Class targetClass = Class.forName(targetName);
        //获取该类中的方法
        Method[] methods = targetClass.getMethods();

        String description = "";

        for(Method method : methods) {
            if(!method.getName().equals(methodName)) {
                continue;
            }
            Class[] clazzs = method.getParameterTypes();
            if(clazzs.length != arguments.length) {
                continue;
            }
            description = method.getAnnotation(SystemServiceLog.class).description();
        }
        return description;
    }
}