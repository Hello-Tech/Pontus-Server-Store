package pstore

import (
	"log"

	_ "github.com/go-sql-driver/mysql"
	"github.com/go-xorm/xorm"
)

var engine *xorm.Engine

func InitStore(connection string) {
	initMySql(connection)

	// just for debug
	engine.ShowSQL(true)
}

func initMySql(connection string) {
	var err error
	engine, err = xorm.NewEngine("mysql", connection)
	if err != nil {
		log.Panic("can not build mysql engine", connection)
	}

	err = engine.Ping()
	if err != nil {
		log.Panic("mysql connect failed")
	}

	log.Println("mysql connect success")
}

func dbEngine() *xorm.Engine {
	return engine
}
