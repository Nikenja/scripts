PATH_TO_BUILD="$(pwd)"
PATH_TO_CMAKE="${PATH_TO_BUILD}/.."
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 "${PATH_TO_CMAKE}"
if [ $? ]; then
    ln -sf "${PATH_TO_BUILD}/compile_commands.json" "${PATH_TO_CMAKE}/compile_commands.json"
fi
