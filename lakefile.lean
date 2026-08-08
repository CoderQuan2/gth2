import Lake
open Lake DSL
package «GTHLean»
lean_lib «GTHLean»
@[default_target]
lean_exe «gthlean» where
  root := `Main
