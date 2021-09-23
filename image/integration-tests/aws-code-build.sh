version=$1
SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")

cd "$SCRIPT_DIR"
pwd
zip -r acc-s3-intg-"$version".zip .
aws s3api put-object --bucket vg2.hdd --key images/acc-s3-intg-"$version".zip --body acc-s3-intg-"$version".zip
rm acc-s3-intg-"$version".zip