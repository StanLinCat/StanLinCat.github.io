FROM ruby:3.2

RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 vscode && \
    useradd -m -u 1000 -g vscode vscode

WORKDIR /usr/src/app
COPY . .

RUN chown -R vscode:vscode /usr/src/app
USER vscode

RUN gem install bundler && bundle install

CMD ["jekyll", "serve", "-H", "0.0.0.0"]