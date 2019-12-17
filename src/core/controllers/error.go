// Copyright Project Harbor Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package controllers

import (
	"github.com/astaxie/beego"
)

// ErrorController handles beego error pages
type ErrorController struct {
	beego.Controller
}

// Error404 renders the 404 page
func (ec *ErrorController) Error404() {
	ec.Data["content"] = "page not found"
	ec.TplName = "404.tpl"
}
