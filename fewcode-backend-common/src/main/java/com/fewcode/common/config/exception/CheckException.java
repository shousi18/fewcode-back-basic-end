package com.fewcode.common.config.exception;

/**
 * 检测结果不一致时，抛出此异常
 *
 * @author 文艺倾年
 */
public class CheckException extends BaseException {

    public CheckException(String code, String errorMsg) {
        super(code, errorMsg);
    }

    public CheckException(ErrorCode code) {
        super(code);
    }

    public CheckException(ErrorCode code, String errorMsg) {
        super(code, errorMsg);
    }
}
