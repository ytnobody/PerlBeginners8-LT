#!/usr/bin/env perl

### お約束ごと
use strict;
use warnings;
use utf8;

### extlib以下のモジュールを読み込めるようにするための工夫
use File::Spec;
use File::Basename 'dirname';
use lib File::Spec->catfile( dirname(__FILE__), 'extlib', 'lib', 'perl5' );

### メール送信系モジュールの読み込み
use Email::Sender::Simple 'sendmail';
use Email::Simple;

### メールファイルの読み込み
open my $fh, '<', 'mail.txt' or die $!;
my $text = join('', (<$fh>));
close $fh;

### メール本文をEmail::Simpleオブジェクトに渡す
my $mail = Email::Simple->new($text);
$mail->header_set('From', 'ytnobody@ytnobody.net');
$mail->header_set('To',   'ytnobody@gmail.com');

### メール送信
sendmail($mail);

