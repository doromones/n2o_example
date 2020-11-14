-module(test).
-compile(export_all).
-include_lib("nitro/include/nitro.hrl").
-include_lib("n2o/include/n2o.hrl").

event(init) ->
  erlang:display("event init"),
  SelectBoxOptions = [
    #option{ value = <<"1"/utf8>>,
             body = <<"Value 1"/utf8>>,
             selected = true},
    #option{ value = <<"2"/utf8>>,
             body = <<"value 2"/utf8>>,
             selected = false}
  ],
  nitro:update(selectedValue,
    #input{id=selectedValue, postback=test, value=1}),
  nitro:update(selectBox,
    #select{id=selectBox, postback=test, body=SelectBoxOptions});

event(test) ->
  erlang:display("event test"),
  SelectedValue = nitro:to_list(nitro:q(selectBox)),
  erlang:display(SelectedValue),
  nitro:update(selectedValue,
    #input{id=selectedValue, postback=test, value=SelectedValue});

event(_) -> [].
