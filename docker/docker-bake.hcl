variable "USER_ID" {}
variable "USER_NAME" {}
variable "GROUP_ID" {}
variable "GROUP_NAME" {}

variable "GIT_CLIFF_VERSION" { default = "2.6.1" }
variable "TYPST_VERSION" { default = "0.12.0" }
variable "HAYAGRIVA_VERSION" { default = "0.8.0" }

target "git-cliff" {
  context = "context"
  target = "git-cliff"
  args = {
    "USER_ID" = "${USER_ID}"
    "USER_NAME" = "${USER_NAME}"
    "GROUP_ID" = "${GROUP_ID}"
    "GROUP_NAME" = "${GROUP_NAME}"
    "VERSION" = "${GIT_CLIFF_VERSION}"
  }
  tags = [
    "bcduggan/cv/git-cliff:latest",
    "bcduggan/cv/git-cliff:${GIT_CLIFF_VERSION}"
  ]
  labels = {
    "net.dugga.cv.tool" = "git-cliff"
  }
}

target "typst" {
  inherits = ["git-cliff"]
  target = "typst"
  args = {
    "VERSION" = "${TYPST_VERSION}"
  }
  tags = [
    "bcduggan/cv/typst:latest",
    "bcduggan/cv/typst:${GIT_CLIFF_VERSION}"
  ]
  labels = {
    "net.dugga.cv.tool" = "typst"
  }
}

target "hayagriva" {
  inherits = ["git-cliff"]
  target = "hayagriva"
  args = {
    "VERSION" = "${HAYAGRIVA_VERSION}"
  }
  tags = [
    "bcduggan/cv/hayagriva:latest",
    "bcduggan/cv/hayagriva:${GIT_CLIFF_VERSION}"
  ]
  labels = {
    "net.dugga.cv.tool" = "hayagriva"
  }
}
