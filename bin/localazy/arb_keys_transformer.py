import json
import os
import re

import stringcase

arb_file_prefix = 'app_'
arb_file_suffix = '.arb'
app_10n_arb_dir_path = '../../lib/app/l10n/arb/'

# Keys which should not be changed.
ignored_keys = ['@@locale']
transformed_files = ['pt_PT']


def list_arb_files():
    arr = os.listdir(app_10n_arb_dir_path)
    return [x for x in arr if x.endswith(arb_file_suffix)]


def to_snake_case(word: str):
    return stringcase.snakecase(word)


def parse_and_transform_arb_file(file: str):
    def key_transformer(data):
        dict_copy = dict(data)
        for key in data:
            curr_value = data[key]
            if not ignored_keys.__contains__(key):
                transformed_key = to_snake_case(key)
                if transformed_key != key and dict_copy.keys().__contains__(transformed_key):
                    # Transformed key with this name already exists, append some value to differentiate from it.
                    transformed_key = transformed_key + '_' + str(len(key))
                del dict_copy[key]
                dict_copy[transformed_key] = curr_value
            if key == ignored_keys[0] and transformed_files.__contains__(curr_value):
                # Replacing value of '@@locale' key to the filename (e.g.: value: pt-PT; filename: app_pt.arb). This
                # key needs to match the filename.
                lang_code = re.sub(f'({arb_file_prefix})|({arb_file_suffix})', '', file)
                if lang_code != curr_value:
                    dict_copy[key] = lang_code
        return dict_copy

    with open(f"{app_10n_arb_dir_path}/{file}", "r", encoding="utf-8") as f:
        transformed_data = json.load(f, object_hook=key_transformer)
    return transformed_data


def write_to_arb_file(file: str, data: str):
    with open(f"{app_10n_arb_dir_path}/{file}", "w", encoding="utf-8") as f:
        f.write(json.dumps(data, ensure_ascii=False, indent=2))


for arb_file in list_arb_files():
    transformed_data = parse_and_transform_arb_file(arb_file)
    write_to_arb_file(arb_file, transformed_data)
