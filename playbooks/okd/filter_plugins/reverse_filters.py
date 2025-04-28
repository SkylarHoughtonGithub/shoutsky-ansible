#!/usr/bin/python
class FilterModule(object):
    """Custom filters for handling IP address conversions."""

    def filters(self):
        return {
            'reverse_subnet': self.reverse_subnet,
        }
    
    def reverse_subnet(self, subnet):
        """
        Takes a subnet like "192.168.100" and returns "100.168.192" for reverse DNS zone.
        """
        # Split the subnet and reverse it
        parts = subnet.split('.')
        return '.'.join(reversed(parts))