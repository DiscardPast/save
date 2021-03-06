package com.hrabl.code.generator.common.exception;

import lombok.extern.slf4j.Slf4j;

/**
 * @author baohua.yin@qq.com
 * @apiNote 自定义服务器异常
 * @date 2019-4-10 15:38:07
 */
@Slf4j
public class ServiceException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    private String msg;
    private int code = 500;

    public ServiceException(String msg) {
        super(msg);
        this.msg = msg;
        log.error("╔═══════════════════════════════════╗");
        log.error("║                                   ║");
        log.error("║    Exception:{} ", msg);
        log.error("║                                   ║");
        log.error("╚═══════════════════════════════════╝");
    }

    public ServiceException(String msg, Throwable e) {
        super(msg, e);
        this.msg = msg;
    }

    public ServiceException(String msg, int code) {
        super(msg);
        this.msg = msg;
        this.code = code;
    }

    public ServiceException(String msg, int code, Throwable e) {
        super(msg, e);
        this.msg = msg;
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }


}
