program test_save
  implicit none
  integer :: hoge=777
  integer :: fuga=666
  real(8) :: vec(3) = (/-3.0d0, -2.0d0, -1.0d0/)
  character(len=72) :: restart_file
  
  CALL system('sh mkdir_save_data.sh') !! ディレクトリの存在を調べてなければ作るスクリプト mkdir_save_data.sh を実行する
  
  !! determine the file name
  write(restart_file,"('./save_data/restart001.save')")
  open(200,file=restart_file,status="replace",position="rewind",form="formatted")
    write(200,"(2(i9,1x))") hoge, fuga
    write(200,"(3(es20.13,1x))") vec(1:3)
  close(200)
  
  stop
endprogram test_save
