log_file=/tmp/expence.log

download_and_extract() {
  echo Download $component code
  curl -s -o /tmp/$component https://expence-artifacts.s3.amazonaws.com/$component.zip >>$log_file

  echo Extracting $component Code
  unzip /tmp/$component.zip >>$log_file
}