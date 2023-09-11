<div class="form-group row">
    <label class="col-lg-4 col-form-label" for="<?= $fieldName ?>"><?= $label; ?></label>
    <div class="col-lg-6">
        <? if (isset($selectEntity) && $selectEntity === true) : ?>
            <select id="<?= $fieldName ?>" class="form-control" name="<?= $fieldName ?>">
                <? foreach ($options as $option) : ?>
                    <option value="<?= $option['id'] ?>" <? if ($value == $option['id']) echo 'selected'; ?>><?= $option['name'] ?></option>
                <? endforeach; ?>
            </select>
        <? elseif (isset($selectOptions) && $selectOptions === true) : ?>
            <select id="<?= $fieldName ?>" class="form-control" name="<?= $fieldName ?>">
                <? foreach ($options as $key => $option) : ?>
                    <option value="<?= $key ?>" <? if ($value == $key) echo 'selected'; ?>><?= $option ?></option>
                <? endforeach; ?>
            </select>
        <? elseif (isset($textarea) && $textarea === true) : ?>
            <textarea rows="4" class="form-control" id="<?= $fieldName ?>" name="<?= $fieldName ?>" placeholder="<?= $placeholder ?? '' ?>"><?= isset($value) ? $value : '' ?></textarea>
        <? else : ?>
            <input type="<?= $inputType ?? 'text' ?>" class="form-control <?= $inputType == 'file' ? 'custom-file-input' : '' ?>" id="<?= $fieldName ?>" name="<?= $fieldName ?>" value="<?= isset($value) ? $value : '' ?>" placeholder="<?= $placeholder ?? '' ?>">
            <? if ($inputType == 'file') : ?>
                <label class="custom-file-label">Choose File</label>
            <? endif; ?>
        <? endif; ?>
    </div>
</div>