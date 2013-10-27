package main
import (
	"github.com/lxn/walk"
	. "github.com/lxn/walk/declarative"
	"strings"
)
func main() {
	var inTE, outTE *walk.TextEdit

	MainWindow{
		Title: "Screamer",
		MinSize: Size{400, 300},
		Layout: VBox{},
		Children: []Widget{
			HSplitter{
				Children: []Widget{
					TextEdit{AssignTo: &inTE},
					TextEdit{AssignTo: &outTE, ReadOnly: true},
				},
			},
			PushButton{
				Text: "Say It Loud",
				OnClicked: func() {
					outTE.SetText(strings.ToUpper(inTE.Text()))
				},
			},
		},
	}.Run()
}
