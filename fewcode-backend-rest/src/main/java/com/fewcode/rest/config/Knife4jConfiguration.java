package com.fewcode.rest.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

/**
 * @author 文艺倾年
 * Swagger配置类，用于配置Swagger2（通过Knife4j）自动生成API文档。
 */
@Configuration
@EnableSwagger2WebMvc
public class Knife4jConfiguration {

    /**
     * 定义一个Docket Bean，用于配置管理平台接口的API文档。
     * @return 返回配置好的Docket实例。
     */
    @Bean(value = "adminManage")
    public Docket adminManage() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(new ApiInfoBuilder()
                        .title("FewCode管理平台接口") // API文档的标题
                        .description("FewCode管理平台接口") // API文档的详细描述
                        .termsOfServiceUrl("https://www.fewcode.site/api/") // 服务条款URL
                        .contact(new Contact("文艺倾年", "https://www.fewcode.site", "1531137510@qq.com")) // 联系人信息
                        .version("1.0") // API文档的版本号
                        .build())
                // 分组名称，在Knife4j界面上会以这个名称展示一组API文档
                .groupName("管理平台接口")
                .select()
                // 指定哪些包下的Controller需要被Swagger扫描
                .apis(RequestHandlerSelectors.basePackage("com.fewcode.rest.controller.manage"))
                // 扫描所有路径
                .paths(PathSelectors.any())
                .build();
    }
}
