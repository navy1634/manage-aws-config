# AWSアカウント共通設定

各rootでは同じmoduleを呼び出し、profileで選択したAWS accountに適用する。Terraform stateにはbackendで指定した既存のS3 bucketを使い、bucket自体はこのrepositoryでは管理しない。

## 管理するリソース

- 共通通知用のSNS topicとSlack向けAmazon Q Developer in chat applications設定。
- 1日USD 3と月USD 100を基準に、80%用・100%用のcost budgetを別々に作成し、実績額がしきい値を超えるとSlackへ通知する。
- GitHub Actions用IAM OIDC provider。IAM roleとtrust policyはこのrootでは作成しません。

## 認証profile

AWS CLI 2.32.0以降を使い、対象rootのproviderに設定したprofileでログインする。

```sh
aws login --profile <profile>
aws sts get-caller-identity --profile <profile>
```

## 予算設定

Budgetsの通知は請求データの反映後に届き、即時ではない。AWS Budgetsの情報は通常1日数回更新される。

AWS Budgets APIには`us-east-1`を使う。
SNS topicとAmazon Q Developer in chat applicationsの設定は、各rootのresource regionに作成する。
Chatbot設定には複数regionのSNS topicを登録できる。

## Slack設定

各アカウントのSSM Parameter Storeに次のStandard `String` parameterを登録する。値にはSlackのworkspace IDと通知先channel IDを設定する。
AWS ChatbotでSlack workspaceを事前に接続する。

| environment | parameter name |
| --- | --- |
| dev | `/manage-aws-config/slack-team-id-dev` |
| dev | `/manage-aws-config/slack-channel-id-dev` |
| prd | `/manage-aws-config/slack-team-id-prd` |
| prd | `/manage-aws-config/slack-channel-id-prd` |

## GitHub Actions OIDC

OIDC providerは各アカウントに1つ作成する。
