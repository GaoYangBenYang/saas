package main

import (
	"fmt"
	_ "saas/routers"

	"github.com/astaxie/beego"
)

func main() {
	if beego.BConfig.RunMode == "dev" {
		beego.BConfig.WebConfig.DirectoryIndex = true
		beego.BConfig.WebConfig.StaticDir["/swagger"] = "swagger"
	}
	// beego.Run()

	//基础学习
	
	//常量
	var a,b *int
	fmt.Println(a,b)


}
	