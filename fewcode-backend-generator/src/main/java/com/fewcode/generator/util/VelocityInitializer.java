package com.fewcode.generator.util;

import com.fewcode.common.config.exception.ErrorCode;
import com.fewcode.common.config.exception.CommonException;
import com.fewcode.generator.constant.Constants;
import lombok.extern.slf4j.Slf4j;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.runtime.RuntimeConstants;

import java.util.Properties;

/**
 * VelocityEngine工厂
 *
 * @author 文艺倾年
 */
@Slf4j
public class VelocityInitializer {
    /**
     * 初始化vm方法
     */
    public static void initVelocity() {
        Properties p = new Properties();
        try {
            // 加载classpath目录下的vm文件
            p.setProperty("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
            // 定义字符集
            p.setProperty(RuntimeConstants.INPUT_ENCODING, Constants.UTF8);
            // 初始化Velocity引擎，指定配置Properties
            Velocity.init(p);
        } catch (Exception e) {
            log.error("VelocityEngine工厂异常", e);
            throw new CommonException(ErrorCode.COMMON_ERROR, e.getMessage());
        }
    }
}
