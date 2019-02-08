package user

import "time"

type User struct {
	Id      int
	Uid     string `xorm:"uid"`
	Mobile  string
	Email   string
	State   int
	Created time.Time `xorm:"created_at"`
	Updated time.Time `xorm:"updated_at"`
}

type UserAuth struct {
	Id       int
	Uid      string `xorm:"uid"`
	Password string
	Token    string
	Created  time.Time `xorm:"created_at"`
	Updated  time.Time `xorm:"updated_at"`
}
