# encoding: utf-8

title 'kops iam user'

content = inspec.profile.file("terraform.json")
params = JSON.parse(content)

USER = params['my_kops_user']['value']

describe aws_iam_user(username: USER) do
  it {should exist}
end