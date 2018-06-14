# encoding: utf-8

title 'kops iam user'

content = inspec.profile.file("terraform.json")
params = JSON.parse(content)

USER = params['my_kops_user']['value']
GROUP = params['my_kops_group']['value']
ACCESS_ID = params['my_kops_access_id']['value']

describe aws_iam_user(USER) do
  it {should exist}
end

describe aws_iam_group(GROUP) do
  it {should exist}
  its('users') { should include USER }
end

describe aws_iam_access_key(username: USER, access_key_id: ACCESS_ID) do
  it {should exist}
  it {should be_active}
end

describe aws_iam_policy('AmazonEC2FullAccess') do
  its('attached_groups') {should include GROUP}
end

describe aws_iam_policy('IAMFullAccess') do
  its('attached_groups') {should include GROUP}
end

describe aws_iam_policy('AmazonRoute53FullAccess') do
  its('attached_groups') {should include GROUP}
end

describe aws_iam_policy('AmazonS3FullAccess') do
  its('attached_groups') {should include GROUP}
end

describe aws_iam_policy('AmazonVPCFullAccess') do
  its('attached_groups') {should include GROUP}
end