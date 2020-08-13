provider "aws" {
### terraform cloud에서 실행할 경우 미리 Environment Variables에 'AWS_ACCESS_KEY_ID', 'AWS_SECRET_ACCESS_KEY', 'AWS_REGION'을 설정해야 함.
  region     = "ap-northeast-2"
  shared_credentials_file = "~/.aws/credentials"
}
