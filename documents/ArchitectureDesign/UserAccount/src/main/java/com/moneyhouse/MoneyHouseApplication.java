package com.moneyhouse;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = {"com.moneyhouse.model.mapper"})
public class MoneyHouseApplication {

	public static void main(String[] args) {
		SpringApplication.run(MoneyHouseApplication.class, args);
	}

}
