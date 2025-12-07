module "eks" {

    # import module template
    source = "terraform-aws-modules/eks/aws"
    version = "~> 20.31"

    # cluster info for control plane
    cluster_name = local.name
    cluster_endpoint_public_access = true

    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets

    cluster_addons = {
            vpc-cni = {
                most-recent = true
            }
            kube-proxy = {
                most-recent = true
            }
            coredns = {
                most-recent = true
            }
        }

    # control plane network
    control_plane_subnet_ids = module.vpc.intra_subnets

    # managing nodes in the cluster
    eks_managed_node_group_defaults = {
        
        instance_types = ["t2.micro"]
        attach_cluster_primary_security_group = true
    }

    eks_managed_node_groups = {
    tf-cluster-node-group = {
        instance_types = ["t2.micro"]
        
        min_size = 2
        max_size = 3
        desire_size = 2

        capacity_type = "SPOT"
    }    
    }

    tags = {
        Environment = local.env
        Terraform = "true"
    }

}