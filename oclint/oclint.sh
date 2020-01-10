source ~/.bash_profile
#获取项目路径
PROJECT_DIR=$(cd `dirname $0`;cd ..;pwd)
cd ${PROJECT_DIR}

buildPath="${PROJECT_DIR}/oclint/build"
compilecommandsJsonFolderPath="${PROJECT_DIR}/oclint"
compilecommandsJsonFilePath="${PROJECT_DIR}/oclint/compile_commands.json"

rm -rf "$compilecommandsJsonFolderPath/build"

echo "${PROJECT_DIR} build start"

xcodebuild SYMROOT=$buildPath -UseModernBuildSystem=NO | xcpretty -r json-compilation-database -o $compilecommandsJsonFilePath

echo "build finished"

cd $compilecommandsJsonFolderPath

oclint-json-compilation-database -- -report-type xcode