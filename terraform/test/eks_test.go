package test

import (
	"fmt"
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestEKSCluster(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "../",
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	clusterEndpoint := terraform.Output(t, terraformOptions, "eks_cluster_endpoint")
	if clusterEndpoint == "" {
		t.Fatalf("Cluster endpoint is empty, the EKS cluster was not created successfully.")
	}
	fmt.Println("EKS cluster endpoint:", clusterEndpoint)
}
