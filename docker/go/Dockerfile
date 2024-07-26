FROM golang:1.22-alpine

# このコメント以後のコメントは[/go/src/app/]フォルダーにて実行させるように指定します
WORKDIR /go/src/app/

# ホストPCの[./back]フォルダーの配置されたソースコードを[/go/src/app/]フォルダーにコピーします
COPY ./back .

# OSのインストール済みのパッケージをバージョンアップし、必要なパッケージをインストールします
RUN apk upgrade --update && \
    apk --no-cache add git gcc musl-dev

RUN go install github.com/go-delve/delve/cmd/dlv@latest

# ホットリロード用のツール
RUN go install github.com/air-verse/air@latest
# airツールを起動します
CMD ["air", "-c", ".air.toml"]

# RUN apt-get update && apt-get install -y git

# RUN go get -u github.com/golang/mock/gomock
# RUN go get -u github.com/golang/mock/mockgen