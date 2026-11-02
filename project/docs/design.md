# Project design

## 1. Resources

- `reports` bucket: match reports; versioning is enabled so overwritten files can be recovered.
- `photos` bucket: team photos; all four public access block settings are true.
- `archive` bucket: season archive; versioning is disabled because it is written once.
- Each bucket has the required `Unit`, `Environment`, `Owner`, and `ManagedBy` tags.

## 2. Dependencies

Each bucket has two dependent resources:

```text
bucket -> versioning
bucket -> public access block
```

## 3. Variables

`env` and `student_id` change between dev and prod. `aws_region` is configurable with a default of `us-east-1`.

## 4. Names and tags

Names use `cc301-${env}-${student_id}-${purpose}`:

- reports: `cc301-dev-NV24212-reports`
- photos: `cc301-dev-NV24212-photos`
- archive: `cc301-dev-NV24212-archive`

Every bucket has `Unit = "CC301"`, `Environment = var.env`, `Owner = var.student_id`, and `ManagedBy = "Terraform"`.

## 5. Evidence

The saved plan proves the resources created and their absence of changes or destroys. `aws s3api get-bucket-versioning` proves versioning, and `aws s3api get-public-access-block` proves the four public-access settings.

## Repetition choice

I use `for_each` because each bucket has a name and the league may drop one later. With `count`, removing one from the middle would shift later buckets and could replace their files.
