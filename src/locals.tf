locals {
  tags = merge(
    var.tags,
    {
      purpose  = var.purpose
      location = var.location
    }
  )
}