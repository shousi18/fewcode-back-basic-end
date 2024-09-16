package com.fewcode.common.config.exception;

/**
 * 异常类型不好归类时，抛出此通用异常
 * 如异常可以明确归类，不建议使用该异常抛出
 *
 * @author 文艺倾年
 */
public class CommonException extends BaseException {

    public CommonException(String code, String errorMsg) {
        super(code, errorMsg);
    }

    public CommonException(ErrorCode code) {
        super(code);
    }

    public CommonException(ErrorCode code, String errorMsg) {
        super(code, errorMsg);
    }
}
