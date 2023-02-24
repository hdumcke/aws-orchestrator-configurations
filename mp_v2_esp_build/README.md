# Build tool to build production ESP32 images for Mini Pupper v2

## Prerequisite

Install https://github.com/hdumcke/aws-orchestrator

## Workflow

Each time you build a new firmware you have to update the version number by adding a tag to the https://github.com/mangdangroboticsclub/mini_pupper_2_bsp.git repository. The tag needs to be in the form of v<major>.<minor> Example:

```
git tag v0.1
```
  
Then deploy the build VM:

```
  aws-deploy ./config.yaml
```

This will start a build VM in EC2 and at the end you will have the build artefact in /home/ubuntu/mini_pupper_app.bin. 

You have to transfer mini_pupper_app.bin to https://www.mangdang.net/ota/

When done delete the build VM:

```
  aws-destroy ./config.yaml
```

**aws-orchestrator is not fully developed. Currently aws-destroy will delete all instances deployed with aws-deploy, we currently do not support concurrent deployments**
