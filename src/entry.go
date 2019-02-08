package pstore

import (
	"log"
    _ "github.com/go-sql-driver/mysql"
    "github.com/go-xorm/xorm"
)

var engine *xorm.Engine

func InitStore(sqlconnection string){
	initMySql(sqlconnection)

	// start sql
}

func initMySql(connection string){
	var err error
	engine, err = xorm.NewEngine("mysql", connection)
	if err != nil {
		log.Panic("can not build mysq engine", connection)
	}

	err = engine.Ping()
	if err == nil {
		log.Println("mysql connect success")
	}else{
		log.Panic("mysql connect failed")
	}

	engine.ShowSQL(true)
}

func dbEngine() *xorm.Engine{
	return engine
}