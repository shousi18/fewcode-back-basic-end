package com.fewcode.generator.vo.query;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fewcode.generator.bean.GenTable;
import lombok.Data;

/**
 * @author 文艺倾年
 */
@Data
public class GenTablePageQuery {

    private Page<GenTable> page;

    private GenTableQuery query;
}
