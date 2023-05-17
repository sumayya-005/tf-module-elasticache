resource "aws_elasticache_cluster" "main" {
  cluster_id           = "${var.env}-${var.name}-elasticache"
  engine               =  var.engine
  node_type            =  var.node_type
  num_cache_nodes      =  var.num_cache_nodes
  parameter_group_name = aws_elasticache_parameter_group.default.name
  engine_version       = var.engine_version
  port                 = 6379
  security_group_ids   = [aws_security_group.sg.id]
  subnet_group_name    = aws_elasticache_subnet_group.default.name
}

resource "aws_elasticache_parameter_group" "default" {
  family = "redis6.x"
  name   = "${var.env}-${var.name}-elasticache"
}

resource "aws_elasticache_subnet_group" "default" {
  name       = "${var.env}-${var.name}-elasticache"
  subnet_ids = var.subnets
}