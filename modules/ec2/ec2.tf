resource "aws_instance" "primus-lg" {

  #name = "primus-lg"
  ami                    = "ami-0f844a9675b22ea32"
  instance_type          = var.instanceType # "t2.micro"
  key_name               = var.key_name     #"terraform-key"

  vpc_security_group_ids = [var.sg]  //aws_security-group.primus-sg.id

  subnet_id = var.cathysbn-id

}


 /* user_data                   = file("shellscript.sh")
  user_data_replace_on_change = true
  //count = var.tags[count.index]*/


