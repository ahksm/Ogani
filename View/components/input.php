<div class="form-group row">
    <label class="col-lg-4 col-form-label" for="<?= $fieldName ?>"><?= $label; ?><span class="text-danger">*</span></label>
    <div class="col-lg-6">
        <input type="<?= $inputType ?? 'text' ?>" class="form-control" id="<?= $fieldName ?>" <?= $fieldName !== 'password' ? 'value="' . $value . '"' : '' ?> name="<?= $fieldName ?>">
        <div class="error"><?= $errors[$fieldName] ?? ''; ?></div>
    </div>
</div>