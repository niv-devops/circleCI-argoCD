package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestEKSCluster(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../",
	}

	terraform.Init(t, terraformOptions)
	terraform.Validate(t, terraformOptions)
        planOutput := terraform.Plan(t, terraformOptions)
        
        assert.Contains(t, planOutput, "Plan:", "Plan not found, cluster won't be created.")
}
